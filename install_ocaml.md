# OCaml Installation

This practical guide aims to install and configure all the necessary
software for developing OCaml code in the **Interpretation and
Compilation of Languages** course.

The entire nstallation process described in this guide, as well as the
whole development in the **Interpretation and Compilation of
Languages** course, will be based on a Unix family Operating System.
The [Unix Development System](#unix-development-system) section shows
how to install a Unix system on a machine running Windows or Mac.

By the end of this guide, you should have installed the following
platforms on your machine:

- A Unix-based development system
- OPAM, the OCaml package manager
- An OPAM *switch*, with a specific compiler version and some packages
- The Visual Studio Code editor, with the OCaml plugin

The entire installation process is heavily based on using the terminal
(console).

## Unix Development System
> [!IMPORTANT]
> This is an excellent opportunity to update your
> Operating System. In general, it is good practice to keep your
> Operating System and installed software updated, especially before
> installing a substantial set of new programs.

### Linux

If you already have a functional Linux system, you can skip to the
[OPAM Installation](#opam-installation) section.

### Mac

As a package manager on a MacOS system, you should choose between
[Homebrew][homebrew] or [MacPorts][macports]. For the purpose of
installing the software required for this course, we believe that
Homebrew offers a simpler and more user-friendly installation
process. Therefore, if you are not already a MacPorts user, we
recommend installing Homebrew and following all the instructions
presented for this platform. **Important note:** you should never try
to install Homebrew and MacPorts simultaneously! These two package
managers are not designed to coexist.

[homebrew]: https://brew.sh/
[macports]: https://www.macports.org/install.php

### Windows

Using a Unix environment within the Windows Operating System is
possible thanks to the *Windows Subsystem for Linux* (WSL). In any
recent version of Windows, WSL is relatively simple to install.
> [!TIP]
> Using WSL may require changing your machine's
> configuration. If, during the WSL installation, the error about
> "virtual machine" appears, then it's a sign that you should enable
> virtualization through your machine's BIOS. The BIOS configuration
> depends on each manufacturer and computer model. A search for `enable
> virtualization [manufacturer] [model]` should return sufficient
> results to resolve the issue.

The WSL installation is completed as follows:

- Open Windows PowerShell as Administrator. To do this, click on
  *Start* and type *PowerShell*. Click on "Run as Administrator" and
  click "Yes" to accept modifications.

- Run `wsl --install`. Alternatively, if you already have a WSL system
  installed, but not the Ubuntu distribution, run `wsl --install -d
  Ubuntu`. Once the Ubuntu distribution download is complete, you will
  likely be asked to restart your machine. The installation will
  continue automatically after restart.

- During installation, you will be asked to enter credentials for the
new Unix system user, that is, a username and a password. Any set of
credentials will work at this stage, as they have no influence on your
Windows credentials. Do not use spaces in your password and memorize
it.

> [!WARNING]
> If you are not asked for any credentials, then
> something went wrong during the installation. Do not proceed beyond
> this point! Uninstall the Ubuntu distribution and restart the process.

**Ubuntu Configuration.** To follow the next instructions, we assume
you installed Ubuntu version 22.04, the default version in WSL. Any
more recent version of this distribution should also allow you to
follow the rest of this section without problems.

Open the Ubuntu application. This application may already be running
if you just installed WSL. You should be presented with the *Bash
prompt*, a console with the following appearance:

```console
user@machine:~$
```
> [!WARNING]
> If the prompt looks like `root@...#` then something went
> wrong. Check if you actually created a username and password in the
> previous step. If yes, your username showing in the prompt should be
> the same as you chose earlier and not `root`. Do not proceed beyond
> this point! The easiest solution would be to reinstall the Ubuntu
> distribution.

In more recent versions of Windows, the combination `Ctrl+Shift+C`
allows you to copy text from the terminal, while the combination
`Ctrl+Shift+V` allows you to paste it. Including the `Shift` key is
mandatory, otherwise you will not get the desired effect.

To update the *Aptitude* manager (Ubuntu distribution's software
manager), run the following command:

```console
sudo apt update
```

You should enter the password you chose in previous steps. The `sudo`
prefix refers to running the `apt update` command in administrator
mode or, in Unix terminology, as *super user*.

> [!WARNING]
> *With great power, comes great responsibility*. Running
> commands as super user allows almost complete control of the system,
> and is therefore potentially dangerous. You should not, therefore,
> run all commands in `sudo` mode, but only when strictly necessary.

Next, run the following command to update the installed software:

```console
sudo apt upgrade -y
```

Finally, proceed to install some useful packages:

```console
sudo apt install -y zip unzip build-essential
```
