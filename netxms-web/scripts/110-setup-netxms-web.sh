#!/bin/bash

set -x
cat << EOF > /as-root/index.html
<html>
  <head> <meta http-equiv="refresh" content="0;url=/nxmc/"> </head>
<body>
</body>
</html>
EOF

cat /as-root/index.html
