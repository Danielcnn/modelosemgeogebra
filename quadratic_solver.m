 function quadratic_solver()
    % Criar uma figura
    figure('Position', [300, 300, 400, 300], 'MenuBar', 'none', ...
           'Name', 'Resolução de Equação Quadrática', 'NumberTitle', 'off');
    
    % Criar caixas de texto para entrada de coeficientes
    uicontrol('Style', 'text', 'Position', [50, 220, 100, 25], ...
              'String', 'Coeficiente a:', 'FontSize', 10);
    a_input = uicontrol('Style', 'edit', 'Position', [160, 220, 100, 25], ...
                        'FontSize', 10);
    
    uicontrol('Style', 'text', 'Position', [50, 180, 100, 25], ...
              'String', 'Coeficiente b:', 'FontSize', 10);
    b_input = uicontrol('Style', 'edit', 'Position', [160, 180, 100, 25], ...
                        'FontSize', 10);
    
    uicontrol('Style', 'text', 'Position', [50, 140, 100, 25], ...
              'String', 'Coeficiente c:', 'FontSize', 10);
    c_input = uicontrol('Style', 'edit', 'Position', [160, 140, 100, 25], ...
                        'FontSize', 10);
    
    % Botão para calcular
    uicontrol('Style', 'pushbutton', 'Position', [100, 80, 200, 40], ...
              'String', 'Calcular Raízes', 'FontSize', 12, ...
              'Callback', @calculate_roots);
          
    function calculate_roots(~, ~)
        % Obter os coeficientes a, b e c
        a = str2double(get(a_input, 'String'));
        b = str2double(get(b_input, 'String'));
        c = str2double(get(c_input, 'String'));
        
        % Verificar se os coeficientes são válidos
        if isempty(a) || isempty(b) || isempty(c) || isnan(a) || isnan(b) || isnan(c)
            errordlg('Por favor, insira coeficientes válidos.', 'Erro');
            return;
        end
        
        % Calcular as raízes da equação quadrática
        discriminant = b^2 - 4*a*c;
        
        if discriminant > 0
            % Duas raízes reais
            root1 = (-b + sqrt(discriminant)) / (2*a);
            root2 = (-b - sqrt(discriminant)) / (2*a);
            roots_text = sprintf('Raízes: %.2f e %.2f', root1, root2);
        elseif discriminant == 0
            % Uma raiz real
            root = -b / (2*a);
            roots_text = sprintf('Raiz: %.2f', root);
        else
            % Raízes complexas
            real_part = -b / (2*a);
            imaginary_part = sqrt(-discriminant) / (2*a);
            roots_text = sprintf('Raízes: %.2f + %.2fi e %.2f - %.2fi', ...
                                 real_part, imaginary_part, real_part, imaginary_part);
        end
        
        % Exibir as raízes em uma caixa de diálogo
        msgbox(roots_text, 'Resultado');
        
        % Criar os valores para o gráfico
        x = linspace(-10, 10, 400);
        y = a*x.^2 + b*x + c;
        
        % Criar o gráfico
        figure('Position', [300, 300, 600, 400]);
        plot(x, y, 'LineWidth', 2);
        grid on;
        xlabel('x');
        ylabel('f(x)');
        title(sprintf('Gráfico da Função Quadrática: %.2fx^2 + %.2fx + %.2f', a, b, c));
        hold on;
        
        % Marcar as raízes no gráfico
        if discriminant >= 0
            plot([root1, root2], [0, 0], 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
            % Adiciona rótulos nas raízes
            text(root1, 0, sprintf('  (%.2f, 0)', root1), 'VerticalAlignment', 'bottom');
            text(root2, 0, sprintf('  (%.2f, 0)', root2), 'VerticalAlignment', 'bottom');
        end
        
        hold off;
    end
end
