

function [ T ] = transform( M, i )
    Count=size(M,1);
    XRef=M(i,1); YRef=M(i,2); ThRef=M(i,4);
    T=zeros(Count,4);
    R=[cos(ThRef) sin(ThRef) 0;...
      -sin(ThRef) cos(ThRef) 0; 0 0 1];  
    for i=1:Count
        B=[M(i,1)-XRef; M(i,2)-YRef; M(i,4)-ThRef];
        T(i,1:3)=R*B;
        T(i,4)=M(i,3);
    end
end