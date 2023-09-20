import 'package:shared_preferences/shared_preferences.dart';

// Clase que gestiona el almacenamiento de preferencias compartidas (SharedPreferences).
class SharedPreferencesManager {
  Future<void> saveChanges(List<bool> nocheckbo) async {
    final prefs = await SharedPreferences.getInstance();
    for (int index = 0; index < nocheckbo.length; index++) {
      await prefs.setBool('checkbox_$index', nocheckbo[index]);
    }
  }

  // Carga el estado de los checkboxes desde SharedPreferences.
  Future<List<bool>> loadCheckboxState(int itemCount) async {
    final prefs = await SharedPreferences.getInstance();
    List<bool> loadedStates = [];
    for (int index = 0; index < itemCount; index++) {
      loadedStates.add(prefs.getBool('checkbox_$index') ?? false);
    }
    return loadedStates;
  }

  // Guarda el estado de un checkbox específico en SharedPreferences.
  Future<void> saveCheckboxState(int index, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('checkbox_$index', value);
  }
}
