use std::path::Path;
use std::fs::File;
use std::io::{Result, Error, ErrorKind, Write};
use std::process::Command;

macro_rules! nb_copies { () => {5};}

macro_rules! copie_of_myself { () => {
"use std::path::Path;\nuse std::fs::File;\nuse std::io::{Result, Error, ErrorKind, Write};\nuse std::process::Command;\n\nmacro_rules! nb_copies { () => {NB_COPIE};}\n\nmacro_rules! copie_of_myself { () => {\n{:?}\n};}\n\nmacro_rules! code { () => {\nfn main() -> Result<()> {\n\n\tlet nb = nb_copies!();\n\tif (nb < 0) {\n\t\treturn Ok(());\n\t}\n\tlet child_filename = format!(\"Sully_{nb}.rs\", nb = nb);\n\tlet child_exec = format!(\"./Sully_{nb}\", nb = nb);\n\n\tif Path::new(&child_filename).exists() {\n\t\treturn Err(Error::new(ErrorKind::AlreadyExists, format!(\"{} already exist !\", child_filename)));\n\t}\n\n\tlet mut child = File::create(&child_filename)?;\n\tlet code = copie_of_myself!();\n\n\tlet final_content = code.replacen(\"{:?}\", &format!(\"{:?}\", code), 1).replacen(\"NB_COPIE\", &(nb - 1).to_string(), 1);\n\n\tchild.write_all(final_content.as_bytes())?;\n\n\tlet output = Command::new(\"rustc\").arg(&child_filename).arg(\"-o\").arg(&child_exec).status()?;\n\n\tif !output.success() {\n\t\treturn Err(Error::new(ErrorKind::Other, format!(\"{} doesn't compile !\", child_filename)));\n\t}\n\n\tCommand::new(&child_exec).status()?;\n\tOk(())\n\n}};}\n\ncode!();"
};}

macro_rules! code { () => {
fn main() -> Result<()> {

	let nb = nb_copies!();
	if (nb < 0) {
		return Ok(());
	}
	let child_filename = format!("Sully_{nb}.rs", nb = nb);
	let child_exec = format!("./Sully_{nb}", nb = nb);

	if Path::new(&child_filename).exists() {
		return Err(Error::new(ErrorKind::AlreadyExists, format!("{} already exist !", child_filename)));
	}

	let mut child = File::create(&child_filename)?;
	let code = copie_of_myself!();

	let final_content = code.replacen("{:?}", &format!("{:?}", code), 1).replacen("NB_COPIE", &(nb - 1).to_string(), 1);

	child.write_all(final_content.as_bytes())?;

	let output = Command::new("rustc").arg(&child_filename).arg("-o").arg(&child_exec).status()?;

	if !output.success() {
		return Err(Error::new(ErrorKind::Other, format!("{} doesn't compile !", child_filename)));
	}

	Command::new(&child_exec).status()?;
	Ok(())

}};}

code!();