Get-ChildItem -Path 'C:\outproject\_PublishedWebsites\LoyalTPL' -Include "web_*.config" -Recurse | Move-Item -Destination 'C:\outproject\_PublishedWebsites\WebConfig' -force
Move-Item -Path "C:\outproject\_PublishedWebsites\LoyalTPL\web.config" -Destination 'C:\outproject\_PublishedWebsites\WebConfig\'

