Get-ChildItem -Path 'C:\Output_DEV\_PublishedWebsites\LoyalTPL\' -Include "web_*.config" -Recurse | Move-Item -Destination 'C:\Output_DEV\_PublishedWebsites\Tranform' -force
Move-Item -Path "C:\Output_DEV\_PublishedWebsites\LoyalTPL\web.config" -Destination 'C:\Output_DEV\_PublishedWebsites\Tranform\'

