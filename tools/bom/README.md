# Unified BOM tool

## Usage


### `join`
Joins a number of BOMs into a single BOM grouped by DigiKey Part Number for ordering.

Requires a input CSV with columns `Name`, `Count`, `BOM`. Column names are case insensitive, order doesn't matter and additional columns will be ignored. The bom for each board is multipled by the desired count before joining into the final BOM. Each BOM must include `Count` and `DKPN` columns. This is useful for large batch order with multiple boards that share components. The resulting file can be edited to meet minimum quantities or add additional parts.

Example:

```bash
bazel run //tools/bom:join -- --map /mnt/data/Formula/olin-electric-motorsports/vehicle/mkvi/boards.csv -o /mnt/data/Formula/olin-electric-motorsports/vehicle/mkvi/bom.csv
```

