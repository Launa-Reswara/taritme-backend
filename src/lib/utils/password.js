import bcrypt from "bcrypt";

export function hashPassword(pass) {
  const salt = bcrypt.genSaltSync(10);
  const hashedPassword = bcrypt.hashSync(pass, salt);

  return hashedPassword;
}

export function checkPassword(pass, hashedPass) {
  const result = bcrypt.compareSync(pass, hashedPass);
  return result;
}
