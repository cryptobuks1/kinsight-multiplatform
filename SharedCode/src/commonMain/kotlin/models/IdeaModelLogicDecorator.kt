package com.kinsight.kinsightmultiplatform

import com.kinsight.kinsightmultiplatform.models.IdeaModel

expect class IdeaModelLogicDecorator (ideaModel: IdeaModel) {

    fun getConviction() : String

    fun getDisplayValueForAlpha(): String

    /* fun getConvictionFromId() : String {
        return when (ideaModel.convictionId) {
            1  -> "High"
            2 -> "Medium"
            3  -> "Low"
            else -> "NA"
        }



    }
    */

}