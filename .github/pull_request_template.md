# Pull Request

## Description
<!-- Mô tả ngắn gọn thay đổi -->

## Widgetbook / Wiki Mapping (REQUIRED for UI components)
<!--
Automation sẽ đọc đúng theo:
1) Checkbox "New component" / "Edit existing component"
2) Heading "## Component(s)"
3) Mỗi component phải đúng 4 dòng: id/name/widgetbook_path/change_summary

Nếu PR này không liên quan UI/component, vẫn tick "Edit existing component" và điền 1 block tối thiểu.
-->

### Type
- [ ] New component
- [ ] Edit existing component

## Component(s)
<!--
Mỗi component = 1 block theo đúng format dưới.
KHÔNG đổi tên key, KHÔNG đổi thứ tự dòng.
-->

- id: ""               # REQUIRED (vd: PrimaryButton, VaultCard, TxRow)
  name: ""             # REQUIRED (tên hiển thị trên wiki)
  widgetbook_path: ""  # REQUIRED (vd: Atoms/Buttons/Primary)
  change_summary: ""   # REQUIRED (1-2 dòng mô tả thay đổi)

<!-- Nếu có nhiều component, copy thêm block ngay bên dưới:
- id: ""
  name: ""
  widgetbook_path: ""
  change_summary: ""
-->

## Related Issues
Closes #

## Screenshots (if applicable)

| Before | After |
|--------|-------|
|        |       |

## Checklist
- [ ] Added/updated Widgetbook use-case(s)
- [ ] My code follows the project's style guidelines
- [ ] I have performed a self-review

## Testing
- [ ] Unit tests
- [ ] Widget tests
- [ ] Integration tests
- [ ] Manual testing

## Notes for Design
- States:
- Notes: