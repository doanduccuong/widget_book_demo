# Pull Request

## Description
<!-- Short summary of the change -->

## Widgetbook / Wiki Mapping (REQUIRED)
<!--
Automation reads strictly:
1) Checkbox "New component" / "Edit existing component"
2) Heading "## Component(s)"
3) Each component block must be EXACTLY 4 lines: id/name/widgetbook_path/change_summary
-->

### Type
- [ ] New component
- [ ] Edit existing component

## Component(s)
- id: ""               # REQUIRED (e.g., PrimaryButton, InputNormal)
  name: ""             # REQUIRED (display name on wiki)
  widgetbook_path: ""  # REQUIRED (e.g., Atoms/Buttons/Primary)
  change_summary: ""   # REQUIRED (1–2 lines summary)

## Parameters Used
<!-- List the public parameters required/used by the component (props/inputs). -->
- isLocked: bool
- title: String
- subtitle: String?
- onPressed: VoidCallback?
- leadingIcon: Widget?
- trailingIcon: Widget?
- enabled: bool
- loading: bool
<!-- Add/remove to match the actual component API -->

## Screenshots
<!-- Add one or more demo screenshots. -->
![Demo 1](PASTE_IMAGE_URL_HERE)
![Demo 2](PASTE_IMAGE_URL_HERE)
![Demo 3](PASTE_IMAGE_URL_HERE)