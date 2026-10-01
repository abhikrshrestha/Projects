# QT9 Web Service Compatibility Tool

This package runs locally on 64-bit Windows. Python is included; no software
installation or developer terminal is required.

## Start a comparison

1. Extract the complete ZIP to a normal local folder.
2. Double-click `Start Compatibility Tool.vbs`. The browser opens without a
   command window.
3. Enter the baseline and target site URLs, usernames, and passwords.
4. Select the Postman collection supplied for the web services being tested.
5. Check the setup, choose calls and values, review the run plan, and start the
   comparison.

**Check Setup** makes one read-only authentication call to each site. Correct
credentials show as accepted. An explicit rejection keeps the tool on Site
Setup; a network, certificate, WSDL, or unavailable-check problem displays a
warning and can be continued.

Request fields start blank. To use the reviewed values for the current QMS
site pair, select **Import Value Set** in Step 2 and choose
`input\value_sets\QMS Two-Site Preset Values.qt9-values.json`. **Clear All Values**
returns every request field to blank without changing Site Setup credentials or
call selection.

**Review Empty** calls can run when the collection does not prove whether a
blank is valid. **Needs Values** calls are not sent when a documented scalar
field rejects empty, a placeholder remains unresolved, or a modifying request
is entirely empty. Reports note when blank test inputs may have produced an
empty or sparse response without changing the comparison result.

Every call starts deselected. Modifying calls remain excluded until their
separate switch is enabled. Credentials and selected request values remain in
the running local session and are not written to configuration files or
reports.

Completed HTML, JSON, JUnit, and raw evidence files are written to the local
`reports` folder. These reports can contain application data and should be
handled as test evidence.

Each comparison uses a short folder name containing its UTC date/time and the
two site names, such as `2026-09-08_16-30Z_baseline-target-c0fb`.

Close the browser tab when finished. The local tool process stops automatically
after its last browser tab closes.

## Presets and optional evidence

The included default profile provides the current QMS terminology,
classifications, and response policies. Reviewed request values are kept in the
separate importable file under `input\value_sets`; they are not applied
automatically. Profile generalization and Advanced Evidence are documented as
future work. The normal comparison requires only two site URLs, credentials,
and a Postman collection.

## If the tool does not open

- Confirm that the ZIP was extracted rather than opened in place.
- Run `Start With Diagnostics.cmd` to see and copy live startup errors.
- Review `logs\latest-session.log` for output from the most recent normal start.
- Keep both launcher files, `runtime`, `qms_compare`, `profiles`,
  and `config` together in the extracted folder.
- Copy the complete error message from the tool window for investigation.
