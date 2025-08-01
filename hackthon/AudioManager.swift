import AVFoundation
import SwiftUI

class AudioManager: ObservableObject {
    static let shared = AudioManager()
    
    private var backgroundMusicPlayer: AVAudioPlayer?
    private var bonusSoundPlayer: AVAudioPlayer?
    private var answerSoundPlayer: AVAudioPlayer?
    
    @Published var isBackgroundMusicEnabled = true
    @Published var isSoundEffectsEnabled = true
    
    private init() {
        setupAudioSession()
        loadSounds()
    }
    
    private func setupAudioSession() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.ambient, mode: .default, options: [.mixWithOthers])
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("Failed to setup audio session: \(error)")
        }
    }
    
    private func loadSounds() {
        // Load background music (birds sound)
        if let birdsURL = Bundle.main.url(forResource: "birds-19624", withExtension: "mp3") {
            do {
                backgroundMusicPlayer = try AVAudioPlayer(contentsOf: birdsURL)
                backgroundMusicPlayer?.numberOfLoops = -1 // Loop indefinitely
                backgroundMusicPlayer?.volume = 10
            } catch {
                print("Failed to load background music: \(error)")
            }
        }
        
        // Load bonus sound (rattling coins)
        if let rattlingURL = Bundle.main.url(forResource: "rattling-coins-379138", withExtension: "mp3") {
            do {
                bonusSoundPlayer = try AVAudioPlayer(contentsOf: rattlingURL)
                bonusSoundPlayer?.volume = 10
            } catch {
                print("Failed to load bonus sound: \(error)")
            }
        }
        
        // Load answer sound (spilled coins)
        if let spilledURL = Bundle.main.url(forResource: "spilled-coins-101296", withExtension: "mp3") {
            do {
                answerSoundPlayer = try AVAudioPlayer(contentsOf: spilledURL)
                answerSoundPlayer?.volume = 10
            } catch {
                print("Failed to load answer sound: \(error)")
            }
        }
    }
    
    func startBackgroundMusic() {
        guard isBackgroundMusicEnabled else { return }
        backgroundMusicPlayer?.play()
    }
    
    func stopBackgroundMusic() {
        backgroundMusicPlayer?.stop()
    }
    
    func pauseBackgroundMusic() {
        backgroundMusicPlayer?.pause()
    }
    
    func playBonusSound() {
        guard isSoundEffectsEnabled else { return }
        bonusSoundPlayer?.currentTime = 0
        bonusSoundPlayer?.play()
    }
    
    func playAnswerSound() {
        guard isSoundEffectsEnabled else { return }
        answerSoundPlayer?.currentTime = 0
        answerSoundPlayer?.play()
    }
    
    func toggleBackgroundMusic() {
        isBackgroundMusicEnabled.toggle()
        if isBackgroundMusicEnabled {
            startBackgroundMusic()
        } else {
            stopBackgroundMusic()
        }
    }
    
    func toggleSoundEffects() {
        isSoundEffectsEnabled.toggle()
    }
} 
