%This is a function
function [ecg_in] = pantom(ecg, Fs)
    % Pan-Tompkins algorithm
    % Low-pass Filter

    B_lp_1 = [1 zeros(1,5) -2 zeros(1,5) 1]/32;
    A_lp_1 = [1 -2 1];
    ecg_lp = filter(B_lp_1,A_lp_1,ecg);
    ecg_lp = ecg_lp/max(ecg_lp);

    %Highpass filter
    B_hp_1 = -[1 zeros(1,15) -32 zeros(1,15) -1];
    A_hp_1 = [1 1];
    ecg_hp = filter(B_hp_1,A_hp_1,ecg_lp);
    ecg_hp = ecg_hp/max(ecg_hp);

    %Derivative filter
    B_df_1 = [1 2 0 -2 -1]*Fs/8;
    A_df_1 = [1];
    ecg_df = filter(B_df_1,A_df_1,ecg_hp);
    ecg_df  = ecg_df/max(ecg_df);

    %Squaring
    ecg_sq = ecg_df .^2;

    %Integrating (reference eqn 3.119 from book)
    B_in_1 = [1 zeros(1,7) -1]/8;
    A_in_1 = [1 -1];
    ecg_in = filter(B_in_1,A_in_1,ecg_sq);
end
