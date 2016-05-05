//
//  AudioMixer.swift
//  Mixer
//
//  Created by Nicholas Arner on 5/2/16.
//  Copyright © 2016 Nicholas Arner. All rights reserved.
//

import Foundation
import AudioKit

public class AudioMixer {
    
    var drums: AKAudioPlayer
    var bass: AKAudioPlayer
    var guitar: AKAudioPlayer
    var lead: AKAudioPlayer
    
    init() {
        
        //Load in our audio samples
        let bundle = NSBundle.mainBundle()
        let drumFile   = bundle.pathForResource("drumloop", ofType: "wav")
        let bassFile   = bundle.pathForResource("bassloop", ofType: "wav")
        let guitarFile = bundle.pathForResource("guitarloop", ofType: "wav")
        let leadFile   = bundle.pathForResource("leadloop", ofType: "wav")

        
        drums  = AKAudioPlayer(drumFile!)
        bass   = AKAudioPlayer(bassFile!)
        guitar = AKAudioPlayer(guitarFile!)
        lead   = AKAudioPlayer(leadFile!)
        
        drums.looping  = true
        bass.looping   = true
        guitar.looping = true
        lead.looping   = true
        
        let mixer = AKMixer(drums, bass, guitar, lead)
        
        AudioKit.output = mixer
        AudioKit.start()
        
        drums.play()
        bass.play()
        guitar.play()
        lead.play()
    }
    
    public func setDrumsVolume(drumsVolume: Float){
        drums.volume = Double(drumsVolume)
    }
    
    public func setBassVolume(bassVolume: Float){
        bass.volume = Double(bassVolume)
    }
    
    public func setGuitarVolume(guitarVolume: Float){
        guitar.volume = Double(guitarVolume)
    }
    
    public func setLeadVolume(leadVolume: Float){
        lead.volume = Double(leadVolume)
    }
}