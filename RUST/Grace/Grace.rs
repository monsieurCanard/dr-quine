use std::path::Path;
use std::fs::File;
use std::io::{Result, Error, ErrorKind, Write};

macro_rules! filename { () => { "Grace_kid.rs"};}

macro_rules! copie_of_myself { () => {
"use std::path::Path;\nuse std::fs::File;\nuse std::io::{Result, Error, ErrorKind, Write};\n\nmacro_rules! filename { () => { \"Grace_kid.rs\"};}\n\nmacro_rules! copie_of_myself { () => {\n{:?}\n};}\n\nmacro_rules! code { () => {\nfn main() -> Result<()> {\n\n\tif Path::new(\"Grace_kid.rs\").exists() {\n\t\treturn Err(Error::new(ErrorKind::AlreadyExists, \"Grace_kid.rs already exist !\"));\n\t}\n//Ceci est mon troisieme commentaire en RUST\n\tlet mut grace_kid = File::create(filename!())?;\n\tlet code = copie_of_myself!();\n\n\tlet final_content = code.replacen(\"{:?}\", &format!(\"{:?}\", code), 1);\n\tgrace_kid.write_all(final_content.as_bytes())?;\n\n\tOk(())\n\n}};}\n\ncode!();"
};}

macro_rules! code { () => {
fn main() -> Result<()> {

	if Path::new("Grace_kid.rs").exists() {
		return Err(Error::new(ErrorKind::AlreadyExists, "Grace_kid.rs already exist !"));
	}
//Ceci est mon troisieme commentaire en RUST
	let mut grace_kid = File::create(filename!())?;
	let code = copie_of_myself!();

	let final_content = code.replacen("{:?}", &format!("{:?}", code), 1);
	grace_kid.write_all(final_content.as_bytes())?;

	Ok(())

}};}

code!();