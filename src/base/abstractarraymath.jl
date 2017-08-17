# isinteger
# isreal
# ctranspose
# transpose
# vec
@primitive vec(x),dy reshape(dy,size(x))
addtest(:vec,rand(2,2))
# _sub: Not exported
# squeeze
# conj
# conj!
# real
# imag
# +
# *
# /
# \
# slicedim
# flipdim
# circshift
# cumsum_kbn
# ipermutedims
if VERSION >= v"0.6-"; @eval begin            # ipermutedims was deprecated in julia6
    @primitive permutedims(x,d...),dy permutedims(dy,invperm(d...))
    addtest(:permutedims,rand(2,3,4),(3,1,2))
end; else; @eval begin
    @primitive permutedims(x,d...),dy ipermutedims(dy,d...)
    @primitive ipermutedims(x,d...),dy permutedims(dy,d...)
    addtest(:permutedims,rand(2,3,4),(3,1,2))
    addtest(:ipermutedims,rand(2,3,4),(3,1,2))
end;end

# if VERSION >= v"0.6-"
#     ipermutedims6(x,dims)=permutedims(x,invperm(dims))
# else
#     ipermutedims6(x,dims)=ipermutedims(x,dims)
# end
# let perm_r=recorder(permutedims), iperm_r=recorder(ipermutedims6)
#     global permutedims, ipermutedims, ipermutedims6
#     permutedims(x::Rec,dims) = perm_r(x,dims)
#     permutedims(::Type{Grad{1}},dy,y,x::Rec,dims)=ipermutedims6(dy,dims)
#     ipermutedims6(x::Rec,dims) = iperm_r(x,dims)
#     ipermutedims6(::Type{Grad{1}},dy,y,x::Rec,dims)=permutedims(dy,dims)
# end


# repmat
# repeat

