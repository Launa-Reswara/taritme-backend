import { pool } from "../utils/pool.js";

export async function getRatingOrComments(type, name) {
  const [results] = await pool.query(
    `SELECT rating, comment FROM penilaian_pelatih_tari WHERE pelatih_tari_name = '${name}'`
  );

  if (results.length) {
    if (type === "rating") {
      const rating =
        results.map((item) => item.rating).reduce((a, b) => a + b) /
        results.length;

      return rating;
    } else if (type === "comments") {
      return results.length;
    }
  }

  return 0;
}
