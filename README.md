# Malicious Chrome / Edge browser extensions
Despite browser safety mechanisms, extension "review" by browser companies and antivirus software, members of the public are at risk from seemlingly innocent extensions. These extensions will offer many services such as pdf functions, translation, games, and AI functions ( chatGPT etc). [Wladimir Palant](https://github.com/palant) has been the torch bearer on uncovering extensions that use obfuscated code, request inappropriate permissions, send user data to remote servers, using redirects and change browser behaviours. Google has often taken a while to respond to reports, and even when extensions are delisted from the Chrome Store they may remain on users' computers for months. Bad actors will often replicate existing extensions or purchase up and coming extensions - so functionality of extensions is usually there, the malicious code sits behind this. So it falls on users to check their browsers for malicious extensions.

Other tips include:
- use as few extensions as possible
- use extensions which are approved in [reputable security forums ](https://www.wilderssecurity.com/threads/more-malicious-extensions-in-chrome-web-store.451628/)
- chrome reviews and install counts cannot be relied upon
- ignore the featured extensions badge in Chrome Store as these do not correlate with safety
- prefer popular and well maintained open source extensions and check that the releases match (e.g. check github and chrome store versions are the same - [see here for why](https://github.com/greatsuspender/thegreatsuspender/issues/1263))
- consider installing directly from popular and well maintained open source downloads ( load unpacked extensions in developer mode )
- compare to the Mozilla Recommended Extensions program
- check privacy policies (though malicious actors will straight up lie in these)
- check permissions for extensions (again hard to differentiate between good and bad actors, some extensions require extensive permissions for their tasks but should request these as needed - it's more obvious when a simple extension is requesting many more permissions than usual).
- consider running extension updates on your own cycle. This will allow you to check that all your extensions continue to be managed by good actors and gives you a chance to check that code continues to be open source.
- consider using firewalls / hosts files / pi-hole etc to block malicious traffic
- use a good adblocker (I use [UBO](https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm)  and consider using a blocker for your search engine (like [ublacklist](https://github.com/nicoleahmed/nicoles-ublacklist))


Here I am pulling together a couple of repositories and some web sources to produce a list of malicious extensions. I will also provide cmd and powershell commands for environments where you cannot run [Palant's check-extensions utility](https://github.com/palant/malicious-extensions-list/releases/)

# [Palant's write up](https://github.com/palant)
## Potentially malicious browser extensions
[Palant](https://github.com/palant) has severak articles on potentially malicious browser extensions in the Google Chrome Web Store [[1]](https://palant.info/2023/05/31/more-malicious-extensions-in-chrome-web-store/) [[2]](https://palant.info/2023/06/05/introducing-pcvark-and-their-malicious-ad-blockers/) [[3]](https://palant.info/2023/06/08/another-cluster-of-potentially-malicious-chrome-extensions/). As the lists of affected extension IDs are getting long and difficult to keep track of, he decided to add them to his [repository](https://github.com/palant/malicious-extensions-list)  (see [list.txt](https://raw.githubusercontent.com/palant/malicious-extensions-list/main/list.txt)).
Note: Some extensions listed are no longer available via Chrome Web Store. If they were installed prior to removal however, they often remain installed.

## Using check-extensions utility
Instead of checking extension IDs against the list manually, you can also [download the check-extensions utility](https://github.com/palant/malicious-extensions-list/releases/). When run without parameters, it will try locating all browser profiles of Chrome and Chromium-based browsers under your user account. A list of browser profiles to check can also be given explicitly as command line parameters.
