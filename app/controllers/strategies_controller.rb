class StrategiesController < InheritedResources::Base

  private

    def strategy_params
      params.require(:strategy).permit(:name)
    end
end

