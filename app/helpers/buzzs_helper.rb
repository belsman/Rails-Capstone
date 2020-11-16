module BuzzsHelper
    def buzzs_params
        params.require(:buzz).permit(:text)
    end
end
