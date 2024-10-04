# project-devShells

The basic premise of this repository is simple, nix flake based development Shells for different kind of projects. You can even modify them to compile directly to a package for production!

Go into individual directory to know more about the each!

## Writing excercise

This README was not supposed to be this comprehensive, but I foolishly made a post on LinkedIn about it, bragging how I set it up after realising that no other approach worked (thanks chatgpt for writing it in such a way that makes it feel like I deserve the Nobel Prize for it) and one of the most talented seniors on our campus noticed that post and wanted to see it! So now I have to do atleast something to show for it.

### What is Nix?

Imagine you are using Arch, happily typing any random terminal commands that you find on the internet. Of course strangers on the internet don't lie! They are so nice!.... And they didn't, that command ran right. You run ```pacman -Syu``` third time this day as you need the latest and greatest software that humanity has to offer. You reboot only to discover that GRUB is broken once again. Being the noob that you are, you either do not know that you CAN fix it or you are too lazy to do it. You boot into your hardy archiso flash drive and boot into it, reinstalling arch 3rd time this week.
(This story is definitely based on a fictional character and not on me).

This is not the only problem with the imperative approach. As you spend time using your OS, no matter which one, bloat definitely starts to build up. The random applications that you installed a while ago and forgot to remove, that one dependency for GIMP that just wouldn't work unless manually compiled managing to outlive your passion for Photo Editing and many more. There is a reason why modern languages use the declarative approach to manage the dependencies, whether it be through cargo for rust or npm for node, even stupid languages like python have these tools now in the form of poetry, pdm and uv.

Nix, solves all that and more. Imagine defining all the packages you need in one file, managed by possibly the best package manager in software world right now giving you assurance of no dependency hell. Imagine just learning one language and using that to define configs for all the things on your system, from systemd-services to the config of your favourite WM without having to learn their syntax at all! And this will just be the beginning of nix. (Have I told you I like Nix yet?)

What happens if you want to install two different versions of the same program, you can't install them both into ```/usr/bin/```, so you decide that one version of python3 will stay in that folder and the other in ```/usr/local/bin``` but what about their dependencies and what about ***their*** dependencies? The situation quickly goes out of hand. This is where a typical FHS falls short. Nix solves it by having no FHS at all! Every package is installed into ```/nix/store/``` and named according to their hash and name (not 100% accurate). So you can have as many versions of each package as you want and each one will be stored as a different file!

I could go on and on about the benefits of nix, ask any of my friends and they sure will be surprised to know that the guy that used to distro hop every singe week/month has been using NixOS for a major part of the year! Before discovering Nix, my favourite distro was Arch, installed on all my devices (I only have one device). I liked living on edge, looking down on the Debian users, surely stability is a coward's folly. Sure I had to reinstall arch a few times to debug and a few times just to remove the bloat and clean out my configs I had gathered trying to imitate the top posters on [r/UnixPorn](https://www.reddit.com/r/unixporn/), but surely that was worth it, where else would I find such a vast library of up-to-date packages, Debian does not have AUR!! Until I discovered Nix. For the rolling release lovers like me, nixpkgs has the greatest number of packages among all repositories, yes even AUR. Not only that, it also has the most up-to-date packages too. [What that means is that for most software you are more likely to find it on nixpkgs than AUR and even if you do find it on AUR, chances are it will be more up-to-date on nix anyway!](https://repology.org/repositories/graphs) And as for the folks who prefer stability over adrenaline, you can follow the release cycle by Nix, latest being 24.05 as of writing. Not only that, even if you mess up, you have the ability to rollback! Messing up just means selecting the previous option during boot!

If you want to know more or some tutorials use these resources-
 - [Nix Pills](https://nixos.org/guides/nix-pills/00-preface)
 - [PHD Thesis for Nix](https://edolstra.github.io/pubs/phd-thesis.pdf)
 - [Zero to Nix](https://zero-to-nix.com/concepts/nixos)
 - Many youtube videos made on it?

Though one thing to keep in mind is you have to work with Nix, not against it. If you want to continue the same workflow you use and not change anything, nix may prove to be an obstacle to you but believe me once you pay the price in the form of the steep learning curve, you to will praise it everywhere you go. Nix is the greatest thing since *Bal Mithai* after all!!

### Flakes

Flakes are an *experimental* feature of Nix, though do not let the name fool you. Flakes have been a part of Nix for many years now and are one of the principal components that make it great. Flakes allow us to have Lock files allowing true reproducibilty!

### This Project

This project is just an implementation of the technologies described above, namely, Nix, Flakes and pdm (for python). I could not find any elegant solution to managing python environments even after searching for 3 days, poetry2nix and dream2nix approach gave so many errors that I could hardly count, so began this humble script!
