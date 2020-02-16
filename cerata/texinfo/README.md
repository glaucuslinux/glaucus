# Texinfo

## Chroot
Evaded some bugs that prevented compilation by switching to a stable release
instead of a development repo. These bugs could be related to:

<https://lists.gnu.org/archive/html/bug-gettext/2019-05/msg00125.html>

### Configure
host's perl is being used to prevent missing header errors

As part of the configure process, a test is made that indicates an error for
TestXS_la-TestXS.lo. This is not relevant and should be ignored.
