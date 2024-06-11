export function normalizeString(str) {
  const normalized = str
    .split("-")
    .map((item) => item[0].toUpperCase() + item.substring(1))
    .join(" ");

  return normalized;
}
