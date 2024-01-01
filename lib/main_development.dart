import 'package:clever_buddy/app/app.dart';
import 'package:clever_buddy/bootstrap.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  const supabaseUrl = 'https://msmcnygourjaqbewrqnq.supabase.co';
  const supabaseKey =
      // ignore: lines_longer_than_80_chars
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1zbWNueWdvdXJqYXFiZXdycW5xIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDQxNDA0NTksImV4cCI6MjAxOTcxNjQ1OX0.BPw6dprHOLkF9YA74s6O1xnnojgx9KDdngv9zdtepfQ';

  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseKey,
  );

  await bootstrap(() => const PageApp());
}
