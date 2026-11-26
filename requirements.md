# Requirements

You have to collect all data from `.log`-files inside the provided directory.

We assume that a valid log is a line in `.log`-file which follows this format:

```
[_<descriptor>_]␣dd:mm:yyyy␣<id>␣<message>
```

- `_` - a space character (` `)
- `␣` - a whitespace character (` `, `\n`, `\r`, etc.)
- `dd:mm:yyyy` - a date (day-month-year)
- `<descriptor>` - one of `INFO`, `DEBUG`, `WARNING`, `ERROR`
- `<id>` - a non-negative integer
- `<message>` - a maybe empty sequence of word characters (any Latin character or an underscore)

You have to filter all previously collected logs and sort them in the descending order by `id` parameter.

Print exactly the selected number of logs:

- Choose the first `limit` logs if `up` option was selected
- Choose the last `limit` logs if `down` option was selected

If the valid log count is less than `limit` then print them all.
