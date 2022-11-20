---
title: "SoK Final Update"
date: 2021-04-16T21:53:25+05:30
draft: false
author: "Anubhav Choudhary"
tags: ["development","kde","tech","linux"]
showTOC: false
---

## Season of KDE 2021 Final Update


<!-- inclde pics -->

Hello again everyone,
I wrote my last update related to Season of KDE in January, and now is the time for the final update. I am sorry I couldn't write blogs in between. The 3 months passed by like at supersonic speed.

![Calamares Logo](https://cdn.hashnode.com/res/hashnode/image/upload/v1633831669757/YYuc8uJV4.png)

So I was selected to work on [Calamares project](github.com/calamares/calamares) under Adriaan de Groot. Most of my work revolved around the functionality of sending the installation logs to paste server online. This feature would help distro maintainers, calamares developers as well as the end users to pin point the errors that possibly may have caused installation to stop (if that happens).

First of all there was some basic (but important) [code](https://github.com/calamares/calamares/pull/1186) work by [Bill Auger](https://github.com/bill-auger). My duty was to convert this work into a functionality, so that it is customizable and a distro maintainer can use the functionality without having to go through all the codebase. Currently a maintainer can easily setup the paste feature after tweaking a [configuration file](https://github.com/calamares/calamares/blob/2a9205ebd972999dbb3b91dda513dc67742346ad/src/branding/default/branding.desc#L222). The customizations offered are : the type of server to paste the data, the specific server (url) to paste the data and the maximum size of data to be send to that server (last one is under [review](https://github.com/calamares/calamares/pull/1666)).

![Current paste feature](https://cdn.hashnode.com/res/hashnode/image/upload/v1633831672114/OrQta2T_8.json)

Then some of the smaller works included hiding the next/prev buttons when calamares is actually installing and adding an option to skip the bootloader installation for EFI system.

### Conclusion

All and all Season of KDE has been a wonderful experience for me. The programme taught me how to write some good, real-world code and how to collaborate with others. Calamares IRC channel was super helpful to me, people are really nice and know their stuff. A special thank to  Adriaan, who used to teach me some seemingly complicated things in the easiest words. Although I never really understood why he randomly writes `:momo` in the channel xD.