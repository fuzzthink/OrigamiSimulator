%% Plot the deformed configuration of the simulation

function plotDeformedShapeTemp(ViewControl,newNode,deformNode,newPanel,PanelNum,T)

    View1=ViewControl(1);
    View2=ViewControl(2);
    Vsize=ViewControl(3);
    Vratio=ViewControl(4);
        
    % Plot Dots
    figure
    hold on
    view(View1,View2); 
    set(gca,'DataAspectRatio',[1 1 1])
    axis([-Vsize*Vratio Vsize -Vsize*Vratio Vsize -Vsize*Vratio Vsize])

    B=size(newPanel);
    FaceNum=B(2);

    for i=1:FaceNum
        tempPanel=cell2mat(newPanel(i));
        patch('Vertices',deformNode,'Faces',tempPanel,'FaceColor','yellow');
    end

    for i=1:FaceNum
        tempPanel=cell2mat(newPanel(i));
        patch('Vertices',newNode,'Faces',tempPanel,'EdgeColor',[0.5 0.5 0.5],'FaceAlpha',0);
    end

    A=size(T);
    nodeNum=A(1);
    
    maxT = max(T);
    minT = min(T);
    
    for i=1:nodeNum
        if T(i)>4/5*(maxT-minT)+minT
            scatter3(deformNode(i,1),deformNode(i,2),deformNode(i,3),...
                'o','red','MarkerFaceColor','red');
        elseif T(i)>3/5*(maxT-minT)+minT
            scatter3(deformNode(i,1),deformNode(i,2),deformNode(i,3),...
                'o','MarkerEdgeColor',[1,0.7,0], 'MarkerFaceColor',[1,0.7,0])    
        elseif T(i)>2/5*(maxT-minT)+minT
            scatter3(deformNode(i,1),deformNode(i,2),deformNode(i,3),...
                'o','yellow','MarkerFaceColor','yellow') 
        elseif T(i)>1/5*(maxT-minT)+minT
            scatter3(deformNode(i,1),deformNode(i,2),deformNode(i,3),...
                'o','cyan','MarkerFaceColor','cyan') 
        else
            scatter3(deformNode(i,1),deformNode(i,2),deformNode(i,3),...
                'o','blue','MarkerFaceColor','blue') 
        end
    end
    
    h=scatter3(-100,-100,-100,...
        'o','red','MarkerFaceColor','red');    
    
    h2=scatter3(-101,-100,-100,...
        'o','MarkerEdgeColor',[1,0.7,0], 'MarkerFaceColor',[1,0.7,0]);
    
    h3=scatter3(-102,-100,-100,...
        'o','yellow','MarkerFaceColor','yellow');    

    h4=scatter3(-103,-100,-100,...
        'o','cyan','MarkerFaceColor','cyan');
    
    h5=scatter3(-104,-100,-100,...
        'o','blue','MarkerFaceColor','blue');
    
    a=compose('%9.2f  to %9.2f',4/5*(maxT-minT)+minT,maxT);
    a2=compose('%9.2f  to %9.2f',3/5*(maxT-minT)+minT,4/5*(maxT-minT)+minT);
    a3=compose('%9.2f  to %9.2f',2/5*(maxT-minT)+minT,3/5*(maxT-minT)+minT);
    a4=compose('%9.2f  to %9.2f',1/5*(maxT-minT)+minT,2/5*(maxT-minT)+minT);
    a5=compose('%9.2f  to %9.2f',0/5*(maxT-minT)+minT,1/5*(maxT-minT)+minT);
    
    legend([h,h2,h3,h4,h5],[a,a2,a3,a4,a5]);

    hold off
end