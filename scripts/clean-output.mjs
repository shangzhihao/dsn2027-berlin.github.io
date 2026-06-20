import { rm } from "node:fs/promises";

await rm("_site", { force: true, recursive: true });
