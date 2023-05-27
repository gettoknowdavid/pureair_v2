List<Map> passwordRules = [
  {
    'name': '1 capital letter',
    'rule': (String text) => RegExp("(?=.*[A-Z])").hasMatch(text)
  },
  {
    'name': '1 number',
    'rule': (String text) => RegExp("(?=.*[0-9])").hasMatch(text)
  },
  {
    'name': '1 special character',
    'rule': (String text) => RegExp("[^A-Za-z0-9]").hasMatch(text)
  },
  {
    'name': 'At least 8 characters',
    'rule': (String text) => RegExp(".{8,}").hasMatch(text)
  },
];
