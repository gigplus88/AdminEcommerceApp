class settingsmodel {
  int? settingsId;
  String? settingsTitlehome;
  String? settingsBodyhome;

  settingsmodel(
      {this.settingsId, this.settingsTitlehome, this.settingsBodyhome});

  settingsmodel.fromJson(Map<String, dynamic> json) {
    settingsId = json['settings_id'];
    settingsTitlehome = json['settings_titlehome'];
    settingsBodyhome = json['settings_bodyhome'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['settings_id'] = this.settingsId;
    data['settings_titlehome'] = this.settingsTitlehome;
    data['settings_bodyhome'] = this.settingsBodyhome;
    return data;
  }
}
