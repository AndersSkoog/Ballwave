const SR = 44100

mutable struct BallWave
  φ::Float64
  ψ::Float64      # oscillator phase
  freq::Float64
  ofst::Float64
end

ω(freq) = 2π*freq/SR
φ̂(w::BallWave) = w.φ - cos(w.ofst + w.ψ)

function step!(w::BallWave)
  w.ψ += ω(w.freq)
end

function ballwave_point(θ::Float64,φ::Float64,res::Int64,ind::Int64)
  d1=(pi-φ)-φ
  u1=d1/res
  ang1=φ+(u1*ind)
  d2=(pi-θ)-θ
  u2=d2/res
  ang2=θ+(u2*ind)
  x=cos(θ)* cos(ang1)
  y=sin(ang2)
  z=cos(θ)*(2*sin(φ-sin(ang1)))
  return [x,y,z]
  #pr= sin(φ)
  #mr=cos(θ)
  #h=[0,0,2*pr]
  #arc=h+[cos(ang1),0,-(sin(ang1))]
  #return mr*arc+[0,sin(ang2),0]
end

function ballwave_arc(θ::Float64,φ::Float64,res::Int64)
  return [ballwave_point(θ,φ,res,ind) for ind in 1:res]
end

function ballwave_surface(w::BallWave,res)
  αs = range(-π/2, π/2, length=res)
  φ = φ̂(w)
  return [ballwave_arc(α, φ, res) for α in αs]
end

function BallWaveCycle(w::BallWave)
  surfaces = []
  for frame in 1:1000
    step!(w)
    surf = ballwave_surface(w,100)
    append!(surf,surfaces)
  end
  return surfaces
end








