export function hideStrExceptFirstLetter(str, match) {
  const hideStr = str
    .split(match)
    .map((item) => item[0].toUpperCase() + item.substring(1));

  return hideStr;
}
