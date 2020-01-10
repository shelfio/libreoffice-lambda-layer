const {writeFileSync} = require('fs');
const {execSync} = require('child_process');

const convertCommand = `export HOME=/tmp && /opt/instdir/program/soffice.bin --headless --norestore --invisible --nodefault --nofirststartwizard --nolockcheck --nologo --convert-to "pdf:writer_pdf_Export" --outdir /tmp /tmp/test.txt`;

module.exports.handler = () => {
  writeFileSync('/tmp/test.txt', Buffer.from('Hello World!'));

  try {
    console.log(execSync(convertCommand).toString('utf8'));
  } catch (e) {
    console.log(execSync(convertCommand).toString('utf8'));
  }

  console.log(execSync('ls -alh /tmp').toString('utf8'));
};
