export function formatToSqlDate(date) {
  const str = date.toISOString().slice(0, 19).replace("T", " ");
  return str;
}
