function out = slant(im)
im = im_box(im,[10,10,10,0]);
moments = im_moments(im,'central');
alpha = atan(2*moments(3)/(moments(1)-moments(2)));
tform = maketform('affine',[1 0 0; sin(0.5*pi-alpha) cos(0.5*pi-alpha) 0; 0 0 1]);
%tform = maketform('affine',[1 0 0; 1 tan(pi-alpha) 0; 0 0 1]);

im = imtransform(im,tform);
out = im_box(im,1,1);
end

