//
//  PKCanvasViewRepresentable.swift
//  UIKitSample
//
//  Created by Mateus Rodrigues.
//

import SwiftUI
import PencilKit

struct PKCanvasViewRepresentable: UIViewRepresentable {
    
    typealias Coordinator = PKCanvasViewRepresentableCoordinator
    
    @Binding var drawing: PKDrawing
    
    var onDidBegin: () -> Void = { }
    var onDidEnd: () -> Void = { }
    
    func makeCoordinator() -> Coordinator {
        .init(parent: self)
    }
    
    func makeUIView(context: Context) -> PKCanvasView {
        let uiView = PKCanvasView()
        uiView.backgroundColor = .clear
        uiView.delegate = context.coordinator
        uiView.drawingPolicy = .anyInput
        uiView.drawing = drawing
        return uiView
    }
    
    func updateUIView(_ uiView: PKCanvasView, context: Context) {
        if uiView.drawing != drawing {
            print(#function)
            uiView.drawing = drawing
        }
    }
    
}

class PKCanvasViewRepresentableCoordinator: NSObject, PKCanvasViewDelegate {
    
    let parent: PKCanvasViewRepresentable
    
    init(parent: PKCanvasViewRepresentable) {
        self.parent = parent
    }
    
    func canvasViewDidBeginUsingTool(_ canvasView: PKCanvasView) {
        parent.onDidBegin()
    }
    
    func canvasViewDidEndUsingTool(_ canvasView: PKCanvasView) {
        parent.onDidEnd()
    }
    
    func canvasViewDrawingDidChange(_ canvasView: PKCanvasView) {
        DispatchQueue.main.async {
            self.parent.drawing = canvasView.drawing
        }
    }
    
}

#Preview {
    
    @Previewable @State var drawing = PKDrawing()
    
    VStack {
        HStack {
            Text("^[\(drawing.strokes.count) stroke](inflect: true) in `drawing`")
            Spacer()
            Button("CLEAR") {
                drawing = .init()
            }
        }
        PKCanvasViewRepresentable(drawing: $drawing)
            .border(.tertiary)
    }
    .padding()
    
}
