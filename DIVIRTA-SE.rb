# Welcome to Sonic Pi

use_bpm 130
cmaster2 = 120

# Adicione SEU PROPRIO SAMPLE PACK, SUBSTITUA OS PATHS PELO PATH DOS RITIMOS QUE VOCÊ DESEJAR!!!


live_loop :met1 do
  sleep 1
end

define :pattern do |pattern|
  return pattern.ring.tick ==  "x"
end


eoe = "C:/Users/gleis/Desktop/Sonic Pi/drum/Drake/Fair Trade/808 (Cactus)_2.wav"
shh = "C:/Users/gleis/Desktop/Sonic Pi/drum/Drake/Fair Trade/fair trade hh shorter.wav"

1.times do
  fx = "C:/Users/gleis/Desktop/Sonic Pi/drum/House/FX/09_PH_FX.wav"
  fx1 = "C:/Users/gleis/Desktop/Sonic Pi/drum/Major/FX/[MS] FX 6.wav"
  #sample fx1
  sleep 0.1
end

live_loop :kick, sync: :met1 do
  kick = "C:/Users/gleis/Desktop/Sonic Pi/drum/Major/Kicks/[MS] Kick - Moody.wav"
  sample kick if pattern "x--x--x---x--x--"
  sleep 0.25
end

live_loop :clap, sync: :met1, attack: 0.01 do
  clap = "C:/Users/gleis/Desktop/Sonic Pi/drum/House/Drum Hits/Claps/02_PH_Clap.wav"
  sleep 1
  sample clap
  sleep 1
end

live_loop :hh, sync: :met1, attack: 0.05 do
  hh = "C:/Users/gleis/Desktop/Sonic Pi/drum/Major/HiHats/[MS] HiHat - Fork & Knife.wav"
  sample hh if pattern "x---x---xx--x---"
  sleep 0.25
end

live_loop :lightbass, sync: :met1, attack: 3, amp: 2 do
  c = 80
  bass = "C:/Users/gleis/Desktop/Sonic Pi/drum/House/Bass Hits/01_PH_Bass_Hit_C.wav"
  b2 = "C:/Users/gleis/Desktop/Sonic Pi/drum/House/Bass Hits/02_PH_Bass_Hit_C.wav"
  sample bass, cutoff: c
  sleep 4
  sample b2, cutoff: c
  sleep 4
  sample bass, cutoff: c
  sample b2, cutoff: c
  sleep 4
end

live_loop :arp, sync: :met1 do
  #stop
  a = 0.3
  r = 0.125
  s = 0.1
  use_synth :saw
  notes = chord(:g3, :minor, num_octaves: 4).mirror
  tick
  play notes.look, sustain: s, release: r, amp: a
  sleep 0.25
end


live_loop :vox, sync: :met1 do
  a = 0.6
  vox = "C:/Users/gleis/Desktop/Sonic Pi/drum/vocal samples mindset/Vocals/70_vocal_new_breed_Am.wav"
  slice = rand_i_look[32]
  #slice_size = 0.3/2/2
  s = slice *slice_size
  f = s + slice_size
  sample vox, start: s, finish: f, amp: a
  sleep 3
end

live_loop :ohh , sync: :met1 do
  ohh = "C:/Users/gleis/Desktop/Sonic Pi/drum/Drake/Fair Trade/openhihat 66.wav"
  sleep 0.5
  sample ohh, cutoff: cmaster2
  sleep 0.5
end

live_loop :cowbell , sync: :met1 do
  cowbell = "C:/Users/gleis/Desktop/Sonic Pi/drum/VISXG' COWBELLS vol.1/VSG cowbell 26.wav"
  sample cowbell, cutoff: cmaster2, amp: 0.05 if pattern "--x---x-x--x--x-"
  sleep 0.25
end

live_loop :synth, sync: :met1 do
  c = 80
  synth = "C:/Users/gleis/Desktop/Sonic Pi/drum/Major/Synths/[MS] Synth - Acid [C].wav"
  sample synth, cutoff: c
  sleep 16
end
