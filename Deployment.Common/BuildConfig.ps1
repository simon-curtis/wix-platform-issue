$Output = "<!-- This is generated from the Deployment.Common.wixproj at build time -->

<Include xmlns=`"http://wixtoolset.org/schemas/v4/wxs`">
  <?define VersionNumber=`"7.6.0`" ?>
  <?define GitHash=`"$(git rev-parse HEAD)`" ?>
</Include>
"

Set-Content .\Config.wxi -Value $Output.Trim(); 