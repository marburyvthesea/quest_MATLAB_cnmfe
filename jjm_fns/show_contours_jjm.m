%% show contours of the all neurons
        function Coor = show_contours_jjm(obj, thr, ind, img, with_label)
            %% show neuron contours
            %% inputs:
            %   thr: threshold for the compactness of the neuron
            %   ind: indices of the neurons to be shown
            %   img: the background image. by default, it uses the
            %   correlation image
            %   with_label: include the label of not
            %% outputs:
            %   Coor: contours of all neurosn
            K = size(obj.A, 2);
            if ~exist('ind', 'var') || isempty(ind)
                ind = (1:K);
            end
            if ~exist('thr', 'var') || isempty(thr)
                thr = 0.9;
            end
            if ~exist('img', 'var') || isempty(img)
                img = obj.Cn;
            end
            
            if ~exist('with_label', 'var') || isempty(with_label)
                with_label = false;
            end
            
            if isempty(obj.Coor) || (length(obj.Coor)~=K)
                Coor = obj.get_contours(thr);
                obj.Coor = Coor;
            else
                Coor = obj.Coor;
            end
            figure('papersize', [obj.options.d2, obj.options.d1]/40);
            init_fig;
            plot_contours_jjm(obj.A(:, ind), img, thr,with_label, [], obj.Coor(ind), 2, 'r');
            colormap gray;
            try
                file_path = [obj.P.log_folder,  'contours_neurons', strrep(get_date(), ' ', '_'), '.pdf'];
                saveas(gcf, file_path);
            end
end