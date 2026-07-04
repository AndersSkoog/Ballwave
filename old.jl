
SR=44100
t=range(0,2pi,SR)
w(freq)=((2*pi)*freq)/SR
θ(n,freq)=θ()

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

    function ballwave_surface(θ::Float64,φ::Float64,res::Int64)
        return [ballwave_arc(θ,φ,res) for θ in t]
        end

        function ballwave(φ,freq,ofst)
            for t in 1:SR
                θ =
                    φ_hat = φ - cos()
            end
        end


