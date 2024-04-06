# BigDebuffs

BigDebuffs is an _extremely lightweight_ addon which replaces unit frame portraits with auras, stances and interrupts whenever present.

The addon menu can be accessed by typing /bd or /bigdebuffs.

### Downloading

To download this addon, hit the **green "Code" button** and then select `Download ZIP`.

Once the addon is finished downloading, extract the contents to your `Interface/AddOns` directory and **importantly** rename the folder from `BigDebuffs-Cata-main` to `BigDebuffs`.

### Backport Notes
The backport is based on BfA BigDebuffs. However, the backport does not contain any raid frame modifications (number of debuffs shown / crowd control effects). The backport is essentially a much improved version of LoseControl.

The backport now supports the backported version of **[Masque][1]**!

Note: When changing anchor from Manual -> Automatic you have to reload if you are using Masque (it will look buggy until you do).
The Masque backport also works in Cata, even though it's for WotLK!

The backport now supports fully rounded corners by implementing **[CircleCooldownTemplate][2]** as an internal library!

---
**Contributions**

 I'd like to thank the following people for their contributions to this release:
> [Jordon][3] for the base addon, as developed throughout MoP-BfA (and possibly further).

> [Jakeswork][4] for minor bug fixes and the Warrior stance logic addition.

> [Tsoukie][5] for structural improvements (and potentially also raid frame support, in the future).

> [Bruen][6] for the initial Cata library update, Cata spell ID list, and also some timer related things.

[1]: https://github.com/bkader/Masque-Cata
[2]: https://github.com/RomanSpector/CircleCooldownTemplate
[3]: https://github.com/jordonwow
[4]: https://github.com/jakeswork
[5]: https://gitlabs.com/tsoukie
[6]: https://github.com/skyler-code
