public function setActiveTab($tab)
{
    $this->activeTab = $tab;
    $this->audioRecordings = []; // Clear the audio recordings state
    $this->dispatch('tab-changed');
}
