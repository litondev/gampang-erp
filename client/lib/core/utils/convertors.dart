class UtilConvertors{
    static bool stringToBool(String? value) {
        if (value == null) return false;

        switch (value.toLowerCase().trim()) {
            case 'true':
            case '1':
            case 'yes':
            case 'on':
              return true;
            case 'false':
            case '0':
            case 'no':
            case 'off':
            case '':
              return false;
            default:
              return true; // fallback jika string tidak dikenali
        }
    }
}