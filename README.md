# Deploy Moodle on Ubuntu on a single VM.

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fgithub.com%2Fkoifans%2Fazure-samples%2Fmaster%2Fazuredeploy.json" target="_blank"><img src="http://azuredeploy.net/deploybutton.png"/></a>
<a href="http://armviz.io/#/?load=https%3A%2F%2Fgithub.com%2Fkoifans%2Fazure-samples%2Fmaster%2Fazuredeploy.json" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>

This template modified from the moodle ARM template for global Azure and deploys Moodle as a LAMP application on Ubuntu. It creates a single Ubuntu VM and does a silent install of MySQL, Apache and PHP on it. It then installs the selected version of Moodle on the VM. If specified, it also installs the corresponding version of the  Microsoft Office 365 plugins for Moodle. After the deployment is successful, you can go to /moodle to start congfiguring Moodle.
