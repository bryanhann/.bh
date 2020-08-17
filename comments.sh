The ACC folder is where included services will store raw data to be
processed by (and eventually removed by) these services. It SHOULD
NOT be archived.  It SHOULD NOT be subject to version control. It
MUST NOT be removed. This is similar to the RAW folder which is
included as well for backwards compatability.

The RAW folder is where included services will store raw data to be
processed by (and eventually removed by) these services. It SHOULD
NOT be archived.  It SHOULD NOT be subject to version control. It
MUST NOT be removed. This is similar to the ACC folder which is
included as well for backwards compatability.

The LOCAL folder is where included services will store code or data
which, though recreatable, would take a long time to recreate. It MAY
be removed but it  SHOULD NOT be removed except for testing purposes
or for wholesale restoration if

The HTTPL folder is where included services will be cloned. It SHOULD
NOT be removed. It MUST NOT be removed prior to confirming that all
repos are first in a clean slate and pushed to their remotes.

