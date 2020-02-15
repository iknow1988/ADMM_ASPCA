function midPoint = GetBestTheta(R,d)
    midPoint = 0;
    lastB = [R(1),sum(min(max(R,0),1))];
    lastS = [R(length(R)),sum(min(max(R-R(length(R)),0),1))];
    midValue = 0;
    while lastS(1)-lastB(1)>0.0001
        midPoint = (lastB(1)+lastS(1))/2;
        midValue = sum(min(max(R-midPoint,0),1));
        if midValue==d
            break
        end
        if midValue < d
            lastS = [midPoint,midValue];
        else
            lastB = [midPoint,midValue];
        end
    end
end
% function midPoint = GetBestTheta(R,d)
%     midPoint = 0;
%     lastB = [0,sum(min(max(R,0),1))];
%     lastS = [R(size(R,1)),sum(min(max(R-R(size(R,1)),0),1))];
%     midValue = 0;
%     while lastB(1)-lastS(1)>0.0001
%         midPoint = (lastB(1)+lastS(1))/2;
%         midValue = sum(min(max(R-midPoint,0),1));
%         if midValue==d
%             break
%         end
%         if midValue > d
%             lastS = [midPoint,midValue];
%         else
%             lastB = [midPoint,midValue];
%         end
%     end
% end