const obj = {
  1: "one",
  2: "two",
  [Symbol.iterator]: function* () {
    yield* Object.entries(this);
  },
};

for (const [key, value] of obj) {
  console.log(`${key} => ${value}`);
}
