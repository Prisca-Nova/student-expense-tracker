import 'package:flutter/material.dart';
import '../utils/db_helper.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  SettingsScreenState createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> {
  bool _isDarkMode = false;
  bool _notificationsEnabled = true;
  bool _biometricAuthEnabled = false;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  void _loadSettings() {
    final settingsBox = DbHelper.settingsBox;
    setState(() {
      _isDarkMode = settingsBox.get('isDarkMode', defaultValue: false);
      _notificationsEnabled = settingsBox.get('notificationsEnabled', defaultValue: true);
      _biometricAuthEnabled = settingsBox.get('biometricAuthEnabled', defaultValue: false);
    });
  }

  void _saveSettings() {
    final settingsBox = DbHelper.settingsBox;
    settingsBox.put('isDarkMode', _isDarkMode);
    settingsBox.put('notificationsEnabled', _notificationsEnabled);
    settingsBox.put('biometricAuthEnabled', _biometricAuthEnabled);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Settings saved successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _saveSettings,
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSectionHeader('Appearance'),
          SwitchListTile(
            title: const Text('Dark Mode'),
            value: _isDarkMode,
            onChanged: (value) {
              setState(() {
                _isDarkMode = value;
              });
            },
          ),
          const Divider(),
          _buildSectionHeader('Notifications'),
          SwitchListTile(
            title: const Text('Enable Notifications'),
            value: _notificationsEnabled,
            onChanged: (value) {
              setState(() {
                _notificationsEnabled = value;
              });
            },
          ),
          const Divider(),
          _buildSectionHeader('Security'),
          SwitchListTile(
            title: const Text('Biometric Authentication'),
            value: _biometricAuthEnabled,
            onChanged: (value) {
              setState(() {
                _biometricAuthEnabled = value;
              });
            },
          ),
          const Divider(),
          _buildSectionHeader('Account'),
          ListTile(
            title: const Text('Change Password'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              // Navigate to change password screen
            },
          ),
          ListTile(
            title: const Text('Logout'),
            trailing: const Icon(Icons.logout),
            onTap: () {
              // Handle logout
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    );
  }
}