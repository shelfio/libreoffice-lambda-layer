const {writeFileSync} = require('fs');
const {execSync} = require('child_process');

exports.handler = () => {
  writeFileSync('/tmp/test.txt', Buffer.from('Hello World!'));

  return execSync(
    `cd /tmp && /opt/instdir/program/soffice --headless --invisible --nodefault --view --nolockcheck --nologo --norestore --convert-to pdf --outdir /tmp test.txt`
  )
};
