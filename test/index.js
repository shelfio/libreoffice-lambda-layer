const {writeFileSync} = require('fs');
const {execSync} = require('child_process');

const convertCommand = `cd /tmp && /opt/instdir/program/soffice --headless --invisible --nodefault --view --nolockcheck --nologo --norestore --convert-to pdf --outdir /tmp test.txt`;

exports.handler = () => {
  writeFileSync('/tmp/test.txt', Buffer.from('Hello World!'));

  console.log(execSync(convertCommand).toString('utf8'));
  console.log(execSync('ls -alh /tmp').toString('utf8'));
};
