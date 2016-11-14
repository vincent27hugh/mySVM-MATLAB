%Fisher Iris data
load fisheriris
inputs=[];
outputs=[];

N=max(size(species));
for i=1:N
    if strcmp(species(i),'setosa')
        inputs=[inputs;meas(i,1:2)];
        outputs=[outputs;1];
    elseif strcmp(species(i),'versicolor')
        inputs=[inputs;meas(i,1:2)];
        outputs=[outputs;-1];
    end
end