#!/usr/bin/env bash

CONTENT=${*:-$(cat)}

extract_title() {
    IFS=$'\n' read -rd '' -a LINES <<<"$1"
    TITLE=$(sed -e 's/<[^>]*>//g' <<< "${LINES[0]}")
}

extract_title "$CONTENT"

HEADER=$(
    cat <<-END
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>$TITLE</title>
  <link rel="stylesheet" href="../styles.css" type="text/css" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>
<body>

END
)

FOOTER=$(
    cat <<-END

</body>
</html>
END
)

printf "$HEADER"
printf "$CONTENT"
printf "$FOOTER"

exit 0
