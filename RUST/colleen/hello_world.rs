fn dummy_function() {}

// Ceci est mon premier commentaire en RUST
fn main() {
	let code = "fn dummy_function() {}\n\n// Ceci est mon premier commentaire en RUST\nfn main() {\n\tlet code = {:?};\n\tprint!(\"{}\", code.replacen(\"{:?}\", &format!(\"{:?}\", code), 1));\n\tdummy_function();\n}";
	print!("{}", code.replacen("{:?}", &format!("{:?}", code), 1));
	dummy_function();
}