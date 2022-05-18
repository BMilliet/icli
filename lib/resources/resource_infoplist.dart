import 'package:icli/resources/resource.dart';

class ResourceInfoplist implements Resource {
  @override
  String content() {
    return """
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict/>
</plist>
""";
  }
}
